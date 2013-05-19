App = Ember.Application.create();

App.Store = DS.Store.extend({
  revision: 12,
//  adapter: 'DS.FixtureAdapter'  
  adapter: DS.RESTAdapter.extend({
    url: 'http://localhost/barprol/work/kletterei/index.php/kletterei/kletterobjekt/3'
  })
});

App.Router.map(function() {
  this.resource('posts', function() {
    this.resource('post', { path: ':post_id' })
  });
  this.resource('about');
});

App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('posts');
  }
});

App.PostsRoute = Ember.Route.extend({
  model: function() {
    return App.Post.find();
  }
});

App.PostController = Ember.ObjectController.extend({
  isEditing: false,
  
  doneEditing: function() {
    this.set('isEditing', false);
  },
  
  edit: function() {
    this.set('isEditing', true);
  }
});


App.Post = DS.Model.extend({
  title: DS.attr('string'),
  author: DS.attr('string'),
  intro: DS.attr('string'),
  extended: DS.attr('string'),
  publishedAt: DS.attr('date')
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

