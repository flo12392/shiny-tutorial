Server components
=======================

The server function contains all the logic on how to render the output elements, and when they should be re-rendered.

When elements have to be rerendered is done using the reactive programming model, which consists of three components: 

* **reactive sources**. (usually inputs in the UI)
* **reactive conductors**.
* **reactive endpoints**. (e.g. plots or tables.)

Whenever a reactive source or reactive conductor changes value, any reactive conductor or reactive endpoint that contains that source will invalidate. This means it will recalculate its value based on the changed input.
