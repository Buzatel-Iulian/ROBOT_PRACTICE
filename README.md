
#   RobotFramework Exercise
This repository contains an exerise script for the RobotFramework automation framework using the RobotSpareBinIndustries website for the "test subject". The repo consists of 3 (in practice 2) tests that can be invoked from the command line:

- `single-test` ( logs in and places an order for a robot model )
- `batch-test` ( places multiple orders for different robot models )
- `cleanup` ( not really a test, the actual function is self-explanatory )
- `all` ( runs `cleanup` > `single-test` > `batch-test` in that order )

##  Setup
- ### Virtual environment
On some IDEs you may have ways to automatically create a virtual environment, in which case you may want to look for information specific for your use case. 

A universal way of doing this however is from the terminal / command line. All you need to do is input the following commands:

> `pip install virtualenv`

> `cd \path\to\ROBOT_PRACTICE`

> `virtualenv --python \path\to\python.exe venv`

> `./venv/Scripts/activate`

- ### Dependencies
To be fair, you can run the scripts without a virtual environment
.
..
...
But it is highly unadvised given the fact that you need to install the dependencies from requirements.txt.
You can do that by running the command:
>`pip install -r requirements.txt`

- ### Webdriver
The final thing you need to do is download the chrome browser webdriver and add it to PATH.
You can get the one for your version of chrome and OS from the following link:
https://pypi.org/project/selenium/

##  Running the scripts
If everything worked out fine in the previous steps then all you need to do to run a test now is type the `invoke` comand in the terminal followed by one of the previously listed test names (for example `invoke single_test`) and you should see the output of the script rolling in the console.

**Note**: Do not worry if you get a `FAIL` output, the tested website was made intentionally buggy for the purpose of being tested, and tests sometimes `FAIL` or `PASS` .