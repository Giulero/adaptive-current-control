% CONFIGROBOT initializes parameters specific of a particular robot
%             (e.g., icuGazeboSim)
%

%% --- Initialization ---

% Gains and parameters for impedance controller
Config.ON_GAZEBO = false;
% ROBOT_DOF        = 23;
ROBOT_DOF        = 1;

% Robot configuration for WBToolbox
WBTConfigRobot             = WBToolbox.Configuration;
WBTConfigRobot.RobotName   = 'icub';
WBTConfigRobot.UrdfFile    = 'model.urdf';
WBTConfigRobot.LocalName   = 'WBT';

% Controlboards and joints list. Each joint is associated to the corresponding controlboard 
% WBTConfigRobot.ControlBoardsNames     = {'torso','left_arm','right_arm','left_leg','right_leg'};
WBTConfigRobot.ControlBoardsNames     = {'left_arm'};
WBTConfigRobot.ControlledJoints       = [];
Config.numOfJointsForEachControlboard = [];

ControlBoards                                        = struct();
% ControlBoards.(WBTConfigRobot.ControlBoardsNames{1}) = {'torso_pitch','torso_roll','torso_yaw'};
% ControlBoards.(WBTConfigRobot.ControlBoardsNames{2}) = {'l_shoulder_pitch','l_shoulder_roll','l_shoulder_yaw','l_elbow'};
% ControlBoards.(WBTConfigRobot.ControlBoardsNames{3}) = {'r_shoulder_pitch','r_shoulder_roll','r_shoulder_yaw','r_elbow'};
% ControlBoards.(WBTConfigRobot.ControlBoardsNames{1}) = {'l_hip_pitch','l_hip_roll','l_hip_yaw','l_knee','l_ankle_pitch','l_ankle_roll'};
ControlBoards.(WBTConfigRobot.ControlBoardsNames{1}) = {'l_shoulder_roll'};
% ControlBoards.(WBTConfigRobot.ControlBoardsNames{5}) = {'r_hip_pitch','r_hip_roll','r_hip_yaw','r_knee','r_ankle_pitch','r_ankle_roll'};

for n = 1:length(WBTConfigRobot.ControlBoardsNames)

    WBTConfigRobot.ControlledJoints       = [WBTConfigRobot.ControlledJoints, ...
                                             ControlBoards.(WBTConfigRobot.ControlBoardsNames{n})];
    Config.numOfJointsForEachControlboard = [Config.numOfJointsForEachControlboard; length(ControlBoards.(WBTConfigRobot.ControlBoardsNames{n}))];
end

k1 = [0.23];
k2 = 0.5;
k3 = k1;
