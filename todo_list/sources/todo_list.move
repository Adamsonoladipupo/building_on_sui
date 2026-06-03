/*
/// Module: todo_list
module todo_list::todo_list;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module todo_list::todo_list{
    public struct Task has store, drop {
        title: vector<u8>,
        completed: bool
    }

    public struct TodoList has key {
        id: UID,
        owner: address,
        tasks: vector<Task>
    }
}