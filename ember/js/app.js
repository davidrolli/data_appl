App = Ember.Application.create();

App.Store = DS.Store.extend({
  revision: 12,

//  adapter: 'DS.FixtureAdapter'

  adapter: DS.RESTAdapter.extend({
//    url: 'http://localhost/barprol/work/kletterei/index.php/kletterei/kletterobjekt/3'
    url: 'http://laravel3.dev'
  })
});

// /applications/7

App.Router.map(function() {
  this.resource('datasources', function() {
    this.resource('datasource', { path: ':post_id' })
  });
  this.resource('about');
});


App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('applications');
  }
});


App.DatasourcesRoute = Ember.Route.extend({
  model: function() {
    return App.Datasource.find();
  }
});


App.Datasource = DS.Model.extend({
  id: DS.attr('integer'),
  table_id: DS.attr('integer'),
  bezeichnung: DS.attr('string'),
  bezeichnung_kurz: DS.attr('string'),
  beschreibung: DS.attr('string'),
  thematik: DS.attr('string'),
  zielpublikum: DS.attr('string'),
  typ_lnk: DS.attr('integer'),
  erstellungsdatum: DS.attr('date'),
  version: DS.attr('string'),
  nachfuehrung: DS.attr('boolean'),
  stand: DS.attr('date'),
  genauigkeit: DS.attr('string'),
  prioritaet: DS.attr('integer'),
  aktiv: DS.attr('boolean'),
  zugriff_via_web: DS.attr('boolean'),
  anzahl_nutzer: DS.attr('integer'),
  db_typ_cd: DS.attr('integer'),
  postgis_version: DS.attr('integer'),
  db_server: DS.attr('string'),
  id_db_server: DS.attr('integer'),
  db_name: DS.attr('string'),
  db_schema: DS.attr('string'),
  id_db_schema: DS.attr('integer'),
  ftp_server: DS.attr('string'),
  path_to_database: DS.attr('string'),
  url_to_data: DS.attr('string'),
  path_to_doc: DS.attr('string'),
  geo_daten: DS.attr('boolean'),
  alphanummerische_daten: DS.attr('boolean'),
  bild_daten: DS.attr('boolean'),
  gis2012: DS.attr('boolean'),
  epsg_cd: DS.attr('integer'),
  id_persons_datenherr: DS.attr('integer'),
  id_persons_verantwortung: DS.attr('integer'),
  id_persons_support: DS.attr('integer'),
  id_persons_hersteller: DS.attr('integer'),
  id_persons_wartung: DS.attr('integer'),
  updated_at: DS.attr('date'),
  created_at: DS.attr('date')
});


/*
App.Post.FIXTURES = [{
  id: 1,
  title: "Winnetou 1",
  author: "Karl May",
  intro: "Rabarber... [und hier der Link](http://de.wikipedia.org/wiki/Winnetou#Winnetou_I). ",
  extended: "...oder so...",
  publishedAt: new Date('05-03-2013')
}, {
  id: 2,
  title: "Winnetou 3",
  author: "Karl May",
  intro: "Inklusive Sam Hawkins ",
  extended: "...und seiner Milli.",
  publishedAt: new Date('11-11-2012')
}];
*/


Ember.Handlebars.registerBoundHelper('date', function(date) {
  return moment(date).fromNow();
});

var showdown = new Showdown.converter();

Ember.Handlebars.registerBoundHelper('markdown', function(input) {
  return new Ember.Handlebars.SafeString(showdown.makeHtml(input));
});

