#[starknet::interface]
trait INewContract<TContractState> {
    fn getDate(self: @TContractState) -> u8;
    fn date(ref self: TContractState, x: u8);
}

#[starknet::contract]
mod new {
    #[storage]
    struct Storage {
        stored_data: u8,
    }

    #[abi(embed_v0)]
    impl NewContract of super::INewContract<ContractState> {
        fn getDate(self: @ContractState) -> u8 {
            self.stored_data.read()
        }

        fn date(ref self: ContractState, x: u8) {
            self.stored_data.write(x)
        }
    }
}