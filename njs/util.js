function hello(r) {
    r.return(200, "Hello world!\n");
}

function getToggleValue(r) {
    return true;
}

export default {hello, getToggleValue}