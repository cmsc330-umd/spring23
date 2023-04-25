fn fact(n:i32) -> i32{
  if n == 0
    {1}
  else
  { let x = fact(n-1);
    x * n
  }
}

fn main(){
  let res = fact(6);
  println!("Fact(6) = {}",res);
}
