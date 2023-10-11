::  Test the %delta agent
::
/+  *test
/=  agent  /app/delta
|%
::
::  Build an example bowl manually.
::
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  [~zod ~zod %hark-store]
    [~ ~]
    [run `@uvJ`(shax run) *time [~zod %delta ud+run]]
  ==
::
::  Build a structure arm to contain the mutable state,
::  a copy of the one in the agent.
::
+$  state
  $:  %0
      values=(list @)
  ==
--
::
::  Test a thread of state mutations, checking that we get
::  the expected result at each step.
::
|%
++  test-delta
 =|  run=@ud
  =^  move
      agent
      (~(on-poke agent (bowl run)) %delta-action !>([%push ~zod 30]))
  =+  !<(=state on-save:agent)
  %+  expect-eq
    !>  [%0 values=~[30]]
    !>  state
--
