enum Actions { Increment, Decrement, Reset }

int counterReducer(state, action) {
  switch (action) {
    case Actions.Increment:
      return state + 1;
    case Actions.Decrement:
      return state - 1;
    case Actions.Reset:
      return 0;
    default:
      return state;
  }
}
