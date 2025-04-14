# Todo Smart Contract

This project contains a simple `Todo` smart contract written in Solidity. The contract allows users to manage a list of tasks, including adding tasks, marking them as completed, and retrieving tasks.

## Features

- **Add Task**: Add a new task with a description.
- **Complete Task**: Mark a task as completed.
- **Get Task**: Retrieve a specific task by its ID.
- **Get All Tasks**: Retrieve all tasks.

## Contract Details

### Functions

1. **`addTask(string memory _description)`**
   - Adds a new task to the list.
   - Emits a `TaskCreated` event.
   - Only requires a task description.

2. **`completeTask(uint _id)`**
   - Marks a task as completed.
   - Emits a `TaskCompleted` event.
   - Requires the task ID.

3. **`getTask(uint _id) public view returns (uint, string memory, bool)`**
   - Retrieves a specific task by its ID.
   - Returns the task's ID, description, and completion status.

4. **`getAllTasks() public view returns (Task[] memory)`**
   - Retrieves all tasks in the contract.

### Events

- **`TaskCreated(uint id, string description)`**: Emitted when a new task is added.
- **`TaskCompleted(uint id)`**: Emitted when a task is marked as completed.

