fn fact(n:u32) -> u32{
  let mut x = n;
  let mut a = 1;

  loop {
    if x <= 1 {break;}
    a = x * a;
    x = x -1;
  }
  a
}
