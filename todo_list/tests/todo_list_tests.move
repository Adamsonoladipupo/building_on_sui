module todo_list::todo_list_test{
    use todo_list::todo_list;
    use sui::test_utils;
    use std::string;    

    #[test_only]
    fun test_create_list (){
        let ctx = test_utils::dummy_tx_context();
        let list = todo_list::create_list(&mut ctx);
        
        assert!(
            todo_list::task_count(&list) == 0,0);
    } 
}
