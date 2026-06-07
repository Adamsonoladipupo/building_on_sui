#[test_only]
module todo_list::todo_list_test{
    use todo_list::todo_list;
    use sui::test_utils;
    use std::string;    

    #[test]
    fun test_new_task() {

        let task = todo_list::new_task(
            string::utf8(b"Learn Move")
        );

        assert!(!todo_list::task_completed(&task),0);
    }
}
