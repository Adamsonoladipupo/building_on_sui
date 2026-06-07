#[test_only]
module todo_list::todo_list_scenario_tests {

    use todo_list::todo_list;
    use sui::test_scenario;

    #[test]
    fun test_scenario_setup(){
        let adam = @0xA;
        let scenario = test_scenario::begin(adam);
        
    }

}