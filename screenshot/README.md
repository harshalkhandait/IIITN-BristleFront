## Introduction
This  introduction  provides  an  overview  of  the  entire  Software  Architecture Document for the system “XXX” . It includes the purpose, scope, definitions, acronyms, abbreviations and overview of the application.
  
## 1.Problem Statement
At times user is unable to find desired product in limited amount of time. Hence, we are build a conversational solution that enables customers to discover and order products.

  
## 2 Installation
Note to user : If you are a MacOS user kindly proceed with Installation of [Xcode](https://apps.apple.com/in/app/xcode/id497799835?mt=12) which can be accessed on [App Store]((https://apps.apple.com/in/app/xcode/id497799835?mt=12)).  
Otherwise all the users other open source OS users can move to Section 2.1.    

### 2.1 Install [HomeBrew](https://brew.sh)
Homebrew is package manager for Macs which makes installing lots of different software like Git, Ruby, and Node simpler. Homebrew lets you avoid possible security problems associated with using the sudo command to install software like Node.
Command on Terminal :  
     
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)” 

Note to user : Make sure you have Xcode installed.
### 2.2 Install [Python3](https://www.python.org)
Python is an interpreted, high-level, general-purpose programming language. Python's design philosophy emphasises code readability with its notable use of significant whitespace. Its language constructs and object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.
  
Goto

    https://www.python.org/downloads/release/python-368/
 and download the required file and kindly proceed with the installation. Else using terminal it can done using the following command.
  
Is user wants to move in via Terminal. User can but it is strongly recemonded to proceed with above mentioned link. 
Command on Terminal : 
  
     
    brew install python3
Note to user : Homebrew might update if the latest version is not installed, Cordially allow it with further steps.
### 2.3 Install PIP ###
  
pip is a de facto standard package-management system used to install and manage software packages written in Python.[4] Many packages can be found in the default source for packages and their dependencies — Python Package Index (PyPI).
  
Command on Terminal :

    sudo easy_install pip3
### 2.4 Install [Rasa](https://rasa.com)
  
Homebrew is package manager for Macs which makes installing lots of different software like Git, Ruby, and Node simpler. Homebrew lets you avoid possible security problems associated with using the sudo command to install software like Node.
  
  
Command on Terminal :

    pip3 install rasa
  
Note to user : If any error is prompted Do not user TensorFlow 2.1.0 we will use a legacy version of [TensorFlow 1.15.0](https://github.com/tensorflow/tensorflow/releases/tag/v1.15.0)
### 2.5 Install [Ngrok](https://ngrok.com/downloads)
  
First, download the ngrok client, a single binary with zero run-time dependencies.
  
On Linux or OSX you can unzip ngrok from a terminal with the following command. On Windows, just double click ngrok.zip.
Move this directory to the same directory where rasa has stored its file(s).Running this command will add your authtoken to your ngrok.yml file. Connecting an account will list your open tunnels in the dashboard, give you longer tunnel timeouts, and more. Visit the dashboard to get your auth token.
  
Command on Terminal(Don't run this CLI Command now) :

    ./ngrok http {your-port-number} 
    
###### Most of the times it is 5005 ######

---

## To fireup your assistant in interactive mode

Create a virtual environment (strongly recommended)
Tools like virtualenv and virtualenvwrapper provide isolated Python environments, which are cleaner than installing packages systemwide (as they prevent dependency conflicts). They also let you install packages without root privileges.
Command on Terminal :
  
    python3 -m venv --system-site-packages ./venv
Run virtual environment 
Command on Terminal :

    source ./venv/bin/activate    

Install Rasa X

    pip3 install rasa-x --extra-index-url https://pypi.rasa.com/simple

When you install Rasa Open Source, the dependencies for the supervised_embeddings - TensorFlow and sklearn_crfsuite get automatically installed. However, spaCy and MITIE need to be separately installed if you want to use pipelines containing components from those libraries.

    pip3 install requests setuptools
    pip3 install future
    pip3 install beautifulsoup4
    pip3 install google
    pip3 install spacy
    python3 -m spacy download en_core_web_md
    python3 -m spacy link en_core_web_md en


Anytime we add new NLU or Core data, or update the domain or configuration, we need to re-train a neural network on our example stories and NLU data. To do this, run the command below.
Command on Terminal :

    rasa train
Since Rasa is a dependency of Rasa X, this will also install the rasa package if you don’t have it already.
To start Rasa X, move into your project directory (or create one using rasa init) and run:

    rasa x
    
Open New Command Line
    
    rasa run actions

  
  Running above commands will give you a link to a localhost link which you can open in your web browser and can access our chatbot there as well.
    

---

## 3. Clone Github Repository ##

### 3.1 Install [Android Studio](https://developer.android.com/studio)
  
Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development.
  
    Steps to follow : https://developer.android.com/studio/install
 
 ### 3.2 Install SDK 
  
Open Android Studio, click on Configure Section where you will find SDK Manager.
  
Change tab to SDK Tools. Click on show details, and select all Android SDK Build Tools. Click on Install.
  
### 3.3 Clone A Git Repository
  
Link :
  
     https://github.com/sauravgajbhiye/Lowes-Campus-Hackathon-Android
  
1. On GitHub, navigate to the main page of the repository.  
<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/clone-repo-clone-url-button.png">
</p>
2. To clone the repository using HTTPS, under "Clone with HTTPS", click . To clone the repository using an SSH key, including a certificate issued by your organization's SSH certificate authority, click Use SSH, then click on the copy symbol.

  <p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/https-url-clone.png">
</p>

3. Open Android Studio and Click on Check From Version Control
<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/https-url-clone.png">
</p>
4. Click on Git
<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/Screenshot%202020-03-02%20at%2010.56.47%20AM.png">
</p>
5. Paste the link which you have copied from Github and click on Test.
<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/Screenshot%202020-03-02%20at%2011.58.37%20AM.png">
</p>
6. Click on 'No' when Studio asks for permission to check out.
<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/Screenshot%202020-03-02%20at%2011.58.48%20AM.png">
</p>

7. Click on 'Open an existing Android Studio Project'
  <p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/Screenshot%202020-03-02%20at%2011.03.57%20AM.png">
</p>
7. Select Build -> Make Project and check that the project builds successfully. You will need Android SDK configured in the settings. You'll need at least SDK version 23. The build.gradle file will prompt you to download any missing libraries.
<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/Screenshot%202020-03-02%20at%2011.04.15%20AM.png">
</p>
8. Install and run the app
Connect the Android device to the computer and be sure to approve any ADB permission prompts that appear on your phone. Select Run -> Run App
<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/Screenshot%202020-03-02%20at%2011.04.31%20AM.png">
</p>
9. Select the deployment target in the connected devices to the device on which the app will be installed. This will install the app on the device

<p align="center">
  <img src="https://github.com/trippymaniac/Test/blob/master/Screenshot%202020-03-02%20at%2011.04.38%20AM.png">
</p>


### 3.4 Lets Continue Back on to Terminal
  
The rasa init command creates all the files that a Rasa project needs and trains a simple bot on some sample data. If you leave out the --no-prompt flag you will be asked some questions about how you want your project to be set up.
  
    rasa init --no-prompt
    
### 3.5 View Your NLU Training Data Set
  
 File Name |  File Description
 ------------- | -------------
 _ _init__.py	| an empty file that helps python find your actions
 actions.py	| code for your custom actions
 config.yml ‘*’ |	configuration of your NLU and Core models
 credentials.yml |	details for connecting to other services
 data/nlu.md ‘*’ | 	your NLU training data
 data/stories.md ‘*’ |	your stories
 domain.yml ‘*’ |	your assistant’s domain
 endpoints.yml |	details for connecting to channels like fb messenger
 models/<timestamp>.tar.gz |	your initial model
  
  The first piece of a Rasa assistant is an NLU model. NLU stands for Natural Language Understanding, which means turning user messages into structured data. To do this with Rasa, you provide training examples that show how Rasa should understand user messages, and then train a model by showing it those examples.
  
    cat {file-you-want-to-view}
    
    
### 3.6 Train a Model
  
Anytime we add new NLU or Core data, or update the domain or configuration, we need to re-train a neural network on our example stories and NLU data. To do this, run the command below.
Command on Terminal :
  
    rasa train
    
    
### 3.7 Create a virtual environment (strongly recommended)
Tools like virtualenv and virtualenvwrapper provide isolated Python environments, which are cleaner than installing packages systemwide (as they prevent dependency conflicts). They also let you install packages without root privileges.
Command on Terminal :

    python3 -m venv --system-site-packages ./venv
### 3.8 Run virtual environment 
Command on Terminal :
    
    source ./venv/bin/activate
    
    
### 3.9 Talk to Our Assistant¶
 Congratulations! 🚀 You just finished making up a ChatBot which can run on both Command Line and Android OS Smartphone. 

  To Run Chatbot on Terminal run:
  
    rasa shell —-endpoints endpoints.yml
     
    
    
### 3.10 Get Our Assistant on your Smartphone
  
Command on Terminal :
  
    rasa run —-endpoints endpoints.yml 
    
  <br />
    
    ./ngrok http 5005
This command will generate two links with two protocols namely, 1.HTTP 2.HTTPS. Copy the link with *HTTPS* Protocol.
  Open AimyboxApplication.java and paste the copied URL in variable named *dialogApi*\
    val dialogApi = RasaDialogApi(unitId, "*\your_https_link_with_ngrok\*/webhooks/rest/webhook")
    
    
    

    
### 3.11 Deploy Application on Device
  
Install and run the app

<img src="https://github.com/trippymaniac/Test/blob/master/5dcd874336364832155971-1.gif">
  
Connect the Android device(in debug mode) to the computer and be sure to approve any ADB permission prompts that appear on your phone. Select Run -> Run app.
  Select the deployment target in the connected devices to the device on which the app will be installed. This will install the app on the device.

