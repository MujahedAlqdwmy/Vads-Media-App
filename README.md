# Vads-Media-App

**Readme File**

**Instructions for Running the Chatbot Flask API**

This Readme file provides instructions on how to set up and run the Chatbot Flask API, which includes two endpoints: 'chat' and 'txt2img'. Before proceeding, ensure you have Python and pip installed on your system.

**1. Installation of Requirements**

Firstly, install the necessary requirements using pip. Open your terminal or command prompt and navigate to the directory where the 'requirements.txt' file is located. Then, run the following command:

```
pip install -r requirements.txt
```

This command will install all the required dependencies for running the Flask API.

**2. Running the Flask API**

After successfully installing the requirements, you can run the Chatbot Flask API. Navigate to the directory where the 'chatbot.py' file is located. Then, execute the following command:

```
python chatbot.py
```

This command will start the Flask server, and you should see output indicating that the server is running.

**4.Run flutter code**

Firstly, install the necessary requirements using pub get command. Open your terminal or command prompt and navigate to the directory where the flutter code folder is located. Then, run the following command:

```
flutter pub get
```

**3. Accessing Endpoints**

Once the Flask server is running, you can access the two endpoints: 'chat' and 'txt2img'. These endpoints accept input data and return the corresponding output.

- **Endpoint: /chat**
  - **Variables:**
    - input: Input text for the chatbot.
  - **Usage:** Send a POST request to `http://localhost:5000/chat` with a JSON payload containing the 'input' variable.

- **Endpoint: /txt2img**
  - **Variables:**
    - img_prompt: Text prompt for generating an image.
  - **Usage:** Send a POST request to `http://localhost:5000/txt2img` with a JSON payload containing the 'img_prompt' variable.

Ensure you provide the required variables in the JSON payload when accessing the endpoints. The API will process the input data and return the appropriate response.

**Note:** Make sure the Flask server is running while accessing the endpoints. You can stop the server by pressing `Ctrl + C` in the terminal where it is running.

That's it! You have successfully set up and run the Chatbot Flask API. You can now utilize the provided endpoints for interacting with the chatbot and generating images from text prompts. If you encounter any issues, refer to the troubleshooting section or seek assistance from the developer.
