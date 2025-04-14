// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Todo {
    struct Task {
        uint id;
        string description;
        bool isCompleted;
    }

    Task[] public tasks;
    uint public taskCount;

    event TaskCreated(uint id, string description);
    event TaskCompleted(uint id);

    // Add a new task
    function addTask(string memory _description) public {
        tasks.push(Task(taskCount, _description, false));
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