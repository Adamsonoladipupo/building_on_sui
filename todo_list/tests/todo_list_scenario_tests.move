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

        let adams = @0xA;

        let scenario = test_scenario::begin(adams);

        test_scenario::next_tx(
            &mut scenario,
            adams
        );

        todo_list::create_todo_list(
            test_scenario::ctx(&mut scenario)
        );

        test_scenario::end(scenario);
    }

}