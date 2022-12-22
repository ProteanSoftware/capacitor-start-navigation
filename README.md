# capacitor-start-navigation [![npm version](https://badge.fury.io/js/%40proteansoftware%2Fcapacitor-start-navigation.svg)](https://badge.fury.io/js/%40proteansoftware%2Fcapacitor-start-navigation)

Capacitor plugin that allows your app to start native navigation


## API

<docgen-index>

* [`launchMapsApp(...)`](#launchmapsapp)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### launchMapsApp(...)

```typescript
launchMapsApp(options: StartNavigationOptions) => Promise<void>
```

Opens the native maps applications with directions started

| Param         | Type                                                                      |
| ------------- | ------------------------------------------------------------------------- |
| **`options`** | <code><a href="#startnavigationoptions">StartNavigationOptions</a></code> |

--------------------


### Interfaces


#### StartNavigationOptions

| Prop            | Type                                  | Description                                                                                                                                   |
| --------------- | ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| **`latitude`**  | <code>string \| number \| null</code> | Geo-coordinate latitude. Can be null for address only search.                                                                                 |
| **`longitude`** | <code>string \| number \| null</code> | Geo-coordinate longitude. Can be null for address only search.                                                                                |
| **`address`**   | <code>string \| null</code>           | Search for an address. Can be used in combination with &lt;c&gt;latitude&lt;/c&gt; and &lt;c&gt;longitude&lt;/c&gt; to refine search results. |
| **`name`**      | <code>string \| null</code>           | Name label to be shown for end Location                                                                                                       |

</docgen-api>
## Usage

```ts
import { StartNavigation } from "@proteansoftware/capacitor-start-navigation";

//
// launches native maps with directions to Warwick, UK
StartNavigation.launchMapsApp({
  latitude: 52.28333,
  longitude: -1.58333,
  name: "Example location"
});

```

## iOS setup

- `sudo gem install cocoapods` _(once a time)_
- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `mkdir www && touch www/index.html`
- `npx cap add ios`
- `npm install --save @proteansoftware/capacitor-start-navigation`
- `npx cap sync ios` _(always do sync after a plugin install)_
- `npx cap open ios`

## Android setup

- `ionic start my-cap-app --capacitor`
- `cd my-cap-app`
- `mkdir www && touch www/index.html`
- `npx cap add android`
- `npm install --save @proteansoftware/capacitor-start-navigation`
- `npx cap sync android` _(always do sync after a plugin install)_
- `npx cap open android`

Now you should be set to go. Try to run your client using `ionic cap run android --livereload`.

## License

MIT