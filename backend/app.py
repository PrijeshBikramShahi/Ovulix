from flask import Flask, request, jsonify
import numpy as np
import onnxruntime as ort

app = Flask(__name__)

# Load your ONNX model
session = ort.InferenceSession('model.onnx')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Get JSON data from request
        data = request.get_json()
        
        # Ensure the data has the correct number of features
        required_features = 12  # Adjust according to your model
        if len(data) != required_features:
            return jsonify({'error': f'Expected {required_features} features but got {len(data)}'}), 400

        # Convert data to numpy array
        input_data = np.array([list(data.values())], dtype=np.float32)
        
        # Perform prediction
        inputs = {session.get_inputs()[0].name: input_data}
        result = session.run(None, inputs)
        
        # Return the prediction
        prediction = result[0][0]
        return jsonify({'prediction': prediction})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
