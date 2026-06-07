module todo_list::todo_list{
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use std::vector;
    use sui::transfer;
    use std::string::String;

    public struct Task has store, drop {
        title: String,
        completed: bool
    }

    public struct TodoList has key {
        id: UID,
        tasks: vector<Task>
    }

    public fun create_list (ctx: &mut TxContext) : TodoList {
        TodoList {id: object::new(ctx),tasks: vector[]}
    }

    public fun add_task(list: &mut TodoList, title: String){
        let task = new_task(title);
        vector::push_back(&mut list.tasks, task);
    }

    public fun complete_task(list:&mut TodoList, index: u64){
        let task = vector::borrow_mut(&mut list.tasks, index);
        task.completed = true;
    } 

    public fun remove_task(list: &mut TodoList,index: u64) {
        vector::remove( &mut list.tasks,index);
    }

    public fun create_todo_list(ctx:&mut TxContext){
        let list = create_list(ctx);
        transfer::transfer(list, tx_context::sender(ctx));
    }

    public fun add_task_entry(list: &mut TodoList, title: String){
        add_task(list, title);
    }

    public fun complete_task_entry(list: &mut TodoList,index: u64) {
        complete_task(list, index);
    }

    public fun remove_task_entry(list: &mut TodoList,index: u64) {
        remove_task(list, index); 
    }

    public fun task_count(list: &TodoList): u64 {
        vector::length(&list.tasks)
    }
    
    public fun is_completed(list: &TodoList,index: u64): bool {
        let task = vector::borrow(&list.tasks,index);
        task.completed
    }

    public fun new_task(title: String): Task {
        Task {
            title,
            completed: false
        }
    }

}