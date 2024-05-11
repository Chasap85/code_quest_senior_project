# CodeQuest

CodeQuest is an experience that aims to revolutionize coding education for students aged
9-13 by immersing them in interactive stories where they write real Python code to
guide quirky characters through challenges, fostering engagement, creativity, and
practical coding skills.

![codequest](https://github.com/Chasap85/code_quest_senior_project/assets/74753263/181efcb9-06bf-4dde-b552-9d91a87ebae8)

## **How to run**
Currently nothing is deployed, but the game can be played by importing this repo into the Godot game engine.

![godot_snippet_import](https://github.com/Chasap85/code_quest_senior_project/assets/74753263/ab950731-ecfc-4bc3-8451-96dad205613d)


## **About our repo**
* **Addons**: Third party plugins supported by Godot that were put to use in this project.
* **Assets**: Assets that are used throughout CodeQuest. Including but not limited to things such as dialogue files, fonts, UI image elements, and level data.
* **Audio**: Audio files for sounds used in game and supporting audio bus files.
* **Components**: Godot Text Scene (TSCN) files that make up the scene trees for components as well as animations. These are used in level scenes and can be reused.
* **Graphics**: Images that are used to make up visuals related to gameplay such as characters and backgrounds, seperate from UI elements stored in **Assets**
* **Level-Scenes**: TSCN files used to makeup the playable levels themselves. Parent scenes that utilize components and animations to tie everything together.
* **Scripts**: Scripts tied to each TSCN file to add functionality through GDScript.

## **How things works**

Each level script acts as a skateboard to start things off with the VisualsHandler and DataHandler components. They then pass things off to handle the rest of gameplay and features.

### **VisualsHandler**

This component is used to chain together each level's visuals and animations. Animations each exist in an "AnimationNode" that must include a "play_animation" function, and are chained together by this component. Proceeding animations is handled upon receiving clearance from the CodeEditor component (Listed below).

![visuals_sys_design](https://github.com/Chasap85/code_quest_senior_project/assets/74753263/349b4f18-8b49-440d-b2ed-33fe2a32b727)


### **DataHandler**

This component loads in the data necessary to set up the coding challenge for each level and hands it off to the appropriate sister components. Level data is stored in json files found at `/assets/level-data/` and is turned into a ChallengeData object for easier use. Data such as challenge description, starter code, expected output, and solution prompt are sent to the CodeEditor and ChallengeDescription components.

### **ChallengeDescription**

This component receives the challenge description data from the DataHandler component so that the user can view their task for each level.

### **CodeEditor**

This component serves as the IDE for users to sandbox and create their solutions in. It receives starter code from the DataHandler to populate the IDE, as well as expected output and solution prompt to send to it's subcomponents for code evaluation. Upon clicking the "compile" button, the code in the IDE is sent to the CodeHandler component to kick the code evaluation process off.

![code_sys_design](https://github.com/Chasap85/code_quest_senior_project/assets/74753263/4c9f2d90-4dab-4ba9-b129-23bea6b7542d)

### **CodeHandler**

This component receives the user's code and expected output from the parent CodeEditor. These items are then packaged into a submission payload to be sent to Judge0's API, which we are using to evalute the user's code and determine if it solves the task given in each level. Upon a correct answer, this component triggers a popup component to congratulate the user. The popup then communicates with DataHandler and VisualsHandler to continue the tasks.

### **FeedbackHandler**

Upon an incorrect answer, this component will receive the user's code from the CodeHandler and pair it with a ChatGPT system prompt (stored in `assets/level-data/gpt_system_prompt.txt`), and the solution prompt received from the parent CodeEditor. All of this information is then used to query ChatGPT using OpenAI's API for actionable feedback that the user can refine their solution with. A popup with the feedback is then triggered allowing the user to make their succeeding attempts.

**Author(s):** Steven Taborda, Chase Little, Cash Snell, Robert Stolworthy  
**Last Updated:** May 9, 2024 
