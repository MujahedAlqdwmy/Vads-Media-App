from flask import Flask, request, jsonify
from langchain.prompts import PromptTemplate
from langchain.memory import ConversationBufferMemory
from langchain.chains import ConversationChain
from langchain_google_genai import ChatGoogleGenerativeAI
from aixplain.factories import PipelineFactory
from dotenv import load_dotenv
import json

load_dotenv()


app = Flask(__name__)


prompt_template ="""
    *you are an expert in writing a story-board for an advertising and film-making company*

    *Instructions:*
        As an expert in writing a story board, your goal is to assist directors by providing a four frames in english from the context:
        
        - Return and Plan in scene_description how each scene flows into the next. Consider pacing, rhythm, and the emotional impact of scene transitions.
        - Only respond in json format and nothing else.d
        - Describe the movement of characters within each scene
        - Pay attention to character dynamics and how they contribute to the story's development.
        - Make the third question the key visual elements and make it the center of atention.
        - Pay attention to Camera Movements and Angles.
        - provide me with the needed tools to film the scene.
        - Split the scene and the prompt.
        - The prompt is for txt2img model that describe each scene static without any dynamics or transitions.
        - I need the respond in json format scenes: (scene_num, scene_description, prompt, tools).
        - The tools should be (camera, lighting, angle, movement)
        

    *Chat History:*:
    {history}

    *Context:*
    {input}

    *Answer:*
""".strip()


change_prompt_template ="""
    *Context:*
        - change only the scene number {input} and nothing else keep other scenes as is.

    *Answer:*
""".strip()


memory = ConversationBufferMemory(memory_key="history", input_key="input", ai_prefix="**Answer:**")


prompt = PromptTemplate(template=prompt_template,
                        input_variables=["history", "input"]
                        )


llm = ChatGoogleGenerativeAI(model="gemini-pro",
                                temperatue=0.3,
                                maxOutputTokens=10240
                                )


chain = ConversationChain(llm=llm,
                        memory=memory,
                        prompt=prompt
                        )



@app.route('/chat', methods=['POST'])
def chat():
    input_text = request.form.get('input')
    # input_text = data.get('input')
    if input_text in ['1', '2', '3', '4']:
        response = chain.predict(input=f"keep other scenes as is, change only the whole scene number {input_text} and nothing else, keep other scenes as is.")
    elif input_text == 'code_red':
        memory.clear()
        response = chain.predict(input=f"change all the scenes and it shouldn't be the same as before.")
    else:
        response = chain.predict(input=input_text)
    json_start = response.find('{')
    json_end = response.rfind('}')
    json_content = response[json_start:json_end + 1]
    parsed_response = json.loads(json_content)
    return jsonify(parsed_response)




@app.route('/txt2img', methods=['POST'])
def txt2img():
    input_text = request.form.get('img_prompt')
    # input_text = data.get('img_prompt')
    img_prompt_template = f"""{input_text}, Pop Art, realistic, edges, sharp, painting, fairy tales, expressive characters, bright colors, detailed, professional, heartwarming stories, photorealistic environments, emotional depth, detailed, black and white, sketch, rough, inspiring themes, realism"""
    pipeline = PipelineFactory.get("662bf0b3e6b5519edc46b829")
    result = pipeline.run(img_prompt_template)
    response = result['data'][0]['segments'][0]['response']
    return jsonify({"image_url": response})



if __name__ == '__main__':
    app.run(debug=True)