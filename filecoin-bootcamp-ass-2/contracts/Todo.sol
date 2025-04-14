// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Todo {
    address public owner;

    struct Task {
        uint id;
        string description;
        bool isCompleted;
        uint[] times;
        address owner;

    }

    modifier onlyOwner(uint _id) {
        require(tasks[_id].owner == msg.sender, "Not the task owner");
        _;
    }

    Task[] public tasks;
    
    uint public taskCount;

    constructor() {
        owner = msg.sender;
    }

    event TaskCreated(uint id, string description);
    event TaskCompleted(uint id);

    // Add a new task
    function addTask(string memory _description) public {
        require(msg.sender == owner, "Only the owner can add tasks");
        tasks.push(Task(taskCount, _description, false, new uint[](0), msg.sender));
        emit TaskCreated(taskCount, _description);
        taskCount++;
    }

    // Mark a task as completed
    function completeTask(uint _id) public {
        require(_id < taskCount, "Task does not exist");
        Task storage task = tasks[_id];
        require(!task.isCompleted, "Task is already completed");
        task.isCompleted = true;
        emit TaskCompleted(_id);
    }

    // Get a specific task
    function getTask(uint _id) public view returns (uint, string memory, bool) {
        require(_id < taskCount, "Task does not exist");
        Task memory task = tasks[_id];
        return (task.id, task.description, task.isCompleted);
    }

    // Get all tasks
    function getAllTasks() public view returns (Task[] memory) {
        return tasks;
    }
}