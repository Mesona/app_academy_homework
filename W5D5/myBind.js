Function.prototype.myBind = function(thing) {
    // return `=> return this.apply(thing)`;
    const myBoundThing = (thing) => {
        this.apply(thing);
    }

    return myBoundThing;
}