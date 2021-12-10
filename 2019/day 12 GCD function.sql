create or replace function gcd(a number, b number)
  return number
  is
  begin
     if b = 0 then
        return a;
     else
        return gcd(b,mod(a,b));
     end if;
  end;

