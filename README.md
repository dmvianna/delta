Delta
=====

`%delta` is an Urbit app for demonstrating how to handle
subscriptions.

`%delta` has to agents:

Delta
-----
`:delta` accepts a single poke, `&delta-action`. It accepts
any atom, which is prepended to a list of `@` in its state. This is
all `:delta` does.

```
> :delta &delta-action [%push ~zod "ha"]
```

Delta Follower
--------------

`:delta-follower` has two possible pokes, `&sub` and `%unsub`.

`:delta-follower [%sub ~zod]` will subscribe one's ship to updates
of `%delta` state happening in planet `~zod`. Upon successful
subscription the current state will be displayed as a Dojo log, and
further updates will also be displayed in this manner.

**Subscription**
```
>   '%delta-follower: subscribe succeeded!'
>>  [%fact %delta-update]
>>  [%init values=~[24.936 10.000 10.000 30 30.000 10.000 30.000]]
> :delta-follower [%sub ~zod]
```

**Update**
```
>>  [%fact %delta-update]
>>  [%push target=~zod value=0]
> :delta &delta-action [%push ~zod 0]
```

`:delta-follower [%unsub ~zod]` will unsubscribe one's ship to updates
of `%delta` state happening in planet `~zod`. So after this command no
more logs will be seen.

```
> :delta-follower [%unsub ~zod]
>=
> :delta &delta-action [%push ~zod 666]
>=
```
(Notice no logs are printed above the commands)
