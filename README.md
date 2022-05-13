# How to run this project locally on your machine

Firstable you need to have installed python on you machine 
the best version is 3.9, but of course you can have latest version



## Local install
* [Download python](https://www.python.org/downloads/)
* [Chrome driver](https://www.selenium.dev/documentation/webdriver/getting_started/install_drivers/)

* if you have homebrew for chrome driver you can use - this is easy peasy
    ```
    brew install cask chromedriver
    ```

## Project install
Once you have the project open in your code editor, go to the terminal and verify that you are located in the particular project
When you run ls you should see all folders and files from finalProject folder

* install robotframework
    ```
    pip3 install robotframework
    ```
* install seleniumlibrary
    ```
    pip3 install robotframework-seleniumlibrary
    ```
* create my venv
    ```
    python3 -m venv venv
    ```
* check what you already have
    ```
    pip3 freeze
    ```
### OR you can install requirements file running
    ```
    pip3  install -r requirements.txt
    ```

## Project Settings
* Right click on the project folder in the code editor
* Copy full path 
* Go to the Project Settings -for mac klick on the project folder and pres ⌘ , for Win File -> Settings
* Click on Language & Frameworks -> Robot Framework (Project)
* Paste full path into Language Server Python 

path should looks like
    ```
    /Users/yourusername/PycharmProjects/finalProject/venv/bin/python
    ```
## Run test
Go to you terminal:
* activate test environment
    ```
    source venv/bin/activate
    ```
* run test file
    ```
    robot test.robot
    ```
