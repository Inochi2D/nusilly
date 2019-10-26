module issue_29;

mixin template Foo(string name)
{
    @(name) unittest
    {

    }
}

mixin Foo!("test name");
