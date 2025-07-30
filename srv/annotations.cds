using { BooksSRV as service } from './books';

annotate service.Books with @odata.draft.enabled;
