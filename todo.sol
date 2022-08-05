// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract todo{
    
    uint private taskCount = 0;
    struct Todo{
       uint id;
       string task; 
    }

    mapping(address => Todo[]) private todoMap;
    
    function add(string calldata _task) public {
        taskCount ++;
        todoMap[msg.sender].push(Todo({id:taskCount, task: _task}));
    }
    function get(uint _id) external view returns (Todo memory){
        Todo storage todo = todoMap[msg.sender][_id - 1];
        return todo;
    }

    function deleteTask(uint256 _id) external
    {
        delete todoMap[msg.sender][_id - 1];
    }
}