@layout('master-layout')

@section('content')
  <ul>
    <li>{{ HTML::link_to_route('all_apps', 'Alle Applikation anzeigen'); }}</li>
    <li>{{ HTML::link_to_route('show_app', 'Eine spezielle Applikation anzeigen', array(7)); }}</li>
    <li>{{ HTML::link_to_route('new_app', 'Eine neue Applikation registrieren'); }}</li>
  </ul>
@endsection
