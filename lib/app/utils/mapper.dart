abstract class Mapper<I, O> {
  O to(I input);
  I from(O output);
}
