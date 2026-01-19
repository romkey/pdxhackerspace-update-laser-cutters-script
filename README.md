# Laser Cutter User Update Script

This is a standalone Ruby script that rewrites a JSON user list into the laser
cutter access list format and can either print it or upload it to a controller.

## Requirements

- Ruby 3.3.10 (see `.ruby-version`)

## Input Format

The script expects a JSON array of user records on STDIN. Each record should
contain:

- `name` (string)
- `permissions` (array of strings)
- `rfids` (array of strings with `facility,uid`)

Only users with the `Laser` permission are included in the output.

## Usage

List available actions:

```
./update-laser-cutter.rb --actions
```

Generate the rewritten user list and print to STDOUT:

```
cat users.json | ./update-laser-cutter.rb users
```

Upload the rewritten list to a controller:

```
ACCESS_TOKEN=user:pass cat users.json | ./update-laser-cutter.rb update HOSTNAME
```

## Environment Variables

- `ACCESS_TOKEN`: required for `update` action, in `USER:PASSWORD` format.
- `OVERRIDE_KEY`: if present and non-empty, adds an override key line to the
  output.

## Docker

Build and run with Docker Compose:

```
docker compose run --rm laser-cutter --actions
```

Print users:

```
cat users.json | docker compose run --rm -T laser-cutter users
```

Update controller:

```
ACCESS_TOKEN=user:pass cat users.json | docker compose run --rm -T -e ACCESS_TOKEN \
  laser-cutter update HOSTNAME
```
