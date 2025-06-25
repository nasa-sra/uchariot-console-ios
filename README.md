# μchariot mobile console

A mobile app driver station for **μchariot**

## Running

After cloning the repository, deploy it to your phone **after setting your developer account**.

> Unless the app has been put on the app store, then just download from there.

## Usage

To connect, enter the pi's IP (if it changed) and hit connect. You should then be able to see the battery voltage fluctuating to know it's connected. At the bottom you can see the different modes that the robot can be in, either **teleop**, or **autonomous**, with a seperate screen for **data collection**. The autonomous mode has multiple other controllers that indicate how it will behave during autonomous. At the top of the screen you will see it says **DISABLED**, this is a button that allows the robot to be **enabled and disabled** from all screens. It will also be **disabled upong switching modes, leaving the app, or turning off your device**.

### Teleop

Teleop has the ability to **watch, take video of, and take photos** through the camera on μchariot as well as drive it through the i**ntegrated joystick**.

### Autonomous

Autonomous has **3 controllers** that can be chosen from that behave differently and shows the **pose of the robot on the map**.

#### Pathing

This is used to **run paths** on the robot.

> To deploy a path, you must use the other console that allows deployment of files. Deploying paths may be supported in the future.

* **Path Name Box** - The file name of the path on the robot to run.
* **Start Button** - Starts path.
* **Stop Button** - Stops path.
* **Reset Pose** - Sets localization origin to the current position.
* **Reset Heading** - Sets applies offset to gyro to zero heading.

#### Following

This is used to **follow a target**, like a person.

#### Summon

This is used to **summon the robot to a person**.

* Target latitude/longitude - Input the target's approximate GPS location.
* Summon - Command the robot to move to the target.
