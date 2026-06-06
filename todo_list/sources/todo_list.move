/*
/// Module: todo_list
module todo_list::todo_list;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module todo_list::todo_list{
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::vector;

    public struct Task has store, drop {
        title: vector<u8>,
        completed: bool
    }

    public struct TodoList has key {
        id: UID,
        // owner: address,
        tasks: vector<Task>
    }

    public fun create_list (
        ctx: &mut TxContext
    ) : TodoList {
        TodoList {
            id: object::new(ctx),
            tasks: vector[]
        }
    }

    public fun add_task(list: &mut TodoList, title: vector<u8>){
        let task = Task {title, completed: false};
        vector::push_back(&mut list.tasks, task); 
    }
}