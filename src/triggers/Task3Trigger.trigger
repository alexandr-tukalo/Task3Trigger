trigger Task3Trigger on Lead (after insert) {
   NewClassTrigger tr = new NewClassTrigger(Trigger.New);
}