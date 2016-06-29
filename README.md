# package-builder-cookbook

Creates environment for Piwik PRO PackageBuilder

## Supported Platforms

- debian 8.2 (Jessie)

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['package-builder']['local-stage']['setup-stage-container']</tt></td>
    <td>Boolean</td>
    <td>whether to setup local stage</td>
    <td><tt>false</tt></td>
  </tr>
</table>

## Usage

### package-builder::default

Include `package-builder` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[package-builder::default]"
  ]
}
```

## License and Authors

Author:: Kamil Zajac (kamil@piwik.pro)
