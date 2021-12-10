create or replace function lcm(a number, b number)
  return number
  is
  begin
     return (a*b)/gcd(a,b);
  end;
 
