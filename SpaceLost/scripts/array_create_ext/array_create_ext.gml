/// array_create_ext(val1, val2, ...)

var res = array_create(argument_count - 1);

for (var i=0; i<argument_count; i++)
{
    res[i] = argument[i];
}

return res;