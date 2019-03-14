# Let's Build a Dataset!

## 1. Setup Qri
First, you'll need the latest CLI binary. head over to our [releases page](https://github.com/qri-io/qri/releases/latest) and install the binary somewhere on your `$PATH`. You should be able to type `qri help` and see a nice introductory message.

Before we can do useful things with Qri, we need to set it up. So let's start by running setup:
```text
$ qri setup
```
Qri will ask you to pick a peername, this is your "handle" on qri. If you don't want to choose one, just hit enter & Qri will use the random peername shown to you in the prompt. Changing your peername is a bit of a pain, so it's worth taking the time now to find one that works for you.


## 2. Create a Dataset!

`cd` to this directory & run the following:

```shell
$ qri save --file dataset.yaml
```

If everything works, you should see green text saying `dataset created` followed by a lot of numbers & letters

## 3. Connect & See your dataset's visualzation

The dataset we just made includes a viz component, which we can see in a browser. First, let's connect up qri:
```
$ qri connect
```

then visit the following URL in your browser:
```
http://localhost:2503/render/me/nyc_for_hire_vehicles/
```

## 3. Check for Updates
If you want to keep this data up-to-date, just run:
```
$ qri update me/nyc_for_hire_vehicles
```

if nothing in the source data has changed, you'll 

## 4. Publish to the world!
If you'd like others to see your work, you can _publish_ it to qri.io:

```
$ qri publish
```

you'll now be able to see your dataset at:
```
https://app.qri.io/[your_peername]/nyc_for_hire_vehicles
```