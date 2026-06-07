#[test_only]
module todo_list::todo_list_scenario_tests {

    use todo_list::todo_list;
    use sui::test_scenario;
    use sui::test_scenario::Scenario;

    #[test]
    fun test_scenario_setup(){
        let adam = @0xA;
        let scenario = test_scenario::begin(adam);
        test_scenario::end(scenario);
    }

    #[test]
    fun test_create_todo_list() {

        let adam = @0xA;

        let mut scenario = test_scenario::begin(adam);

        test_scenario::next_tx( &mut scenario, adam);

        let ctx = test_scenario::ctx(&mut scenario);

        todo_list::create_todo_list(ctx);

        test_scenario::end(scenario);}

}