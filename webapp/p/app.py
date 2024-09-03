from flask import Flask, request, render_template
import pickle
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestRegressor

app = Flask(__name__)

# Load the model and scaler
with open('model.pkl', 'rb') as model_file:
    model = pickle.load(model_file)

with open('scaler.pkl', 'rb') as scaler_file:
    scaler = pickle.load(scaler_file)

# Define preprocessing function
def preprocess_features(features):
    """
    Preprocess the input features.
    """
    features_df = pd.DataFrame([features])
    required_columns = [
        'LengthofCycle', 'MeanCycleLength', 'LengthofMenses', 'Age',
        'Height', 'Weight', 'Numberpreg', 'Miscarriages', 'Abortions',
        'Livingkids', 'NumberofDaysofIntercourse', 'BMI'
    ]
    for col in required_columns:
        if col not in features_df.columns:
            features_df[col] = 0  # or another default value
    features_df = features_df[required_columns]
    features_scaled = scaler.transform(features_df)
    return features_scaled

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Extract features from form with default values
        features = {
            'LengthofCycle': float(request.form.get('LengthofCycle', 0)),
            'MeanCycleLength': float(request.form.get('MeanCycleLength', 0)),
            'LengthofMenses': float(request.form.get('LengthofMenses', 0)),
            'Age': float(request.form.get('Age', 0)),
            'Height': float(request.form.get('Height', 0)),
            'Weight': float(request.form.get('Weight', 0)),
            'Numberpreg': float(request.form.get('Numberpreg', 0)),
            'Miscarriages': float(request.form.get('Miscarriages', 0)),
            'Abortions': float(request.form.get('Abortions', 0)),
            'Livingkids': float(request.form.get('Livingkids', 0)),
            'NumberofDaysofIntercourse': float(request.form.get('NumberofDaysofIntercourse', 0)),
            'BMI': float(request.form.get('BMI', 0))
        }

        # Preprocess features
        preprocessed_features = preprocess_features(features)
        
        # Make prediction
        prediction = model.predict(preprocessed_features)
        
        return render_template('index.html', prediction_text=f'Prediction: {prediction[0]:.2f}')
    except ValueError as ve:
        return render_template('index.html', prediction_text=f'ValueError: {ve}')
    except KeyError as ke:
        return render_template('index.html', prediction_text=f'KeyError: {ke}')
    except Exception as e:
        return render_template('index.html', prediction_text=f'An error occurred: {e}')

if __name__ == "__main__":
    app.run(debug=True, port=5001)
