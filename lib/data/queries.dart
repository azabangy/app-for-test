const String fetchCountriesQuery = '''
  query  {
    countries  {
      name
      capital
    }
  }
''';
const String fetchRepositoryQuery = '''
  query (\$afterCursor: String){
  viewer {
    login
    repositories(first:10,after:\$afterCursor) {
      nodes{
        id
        name
        description
        url
        languages(first:100){
             nodes{
              id
              name
              color
            }
          }
      }
      pageInfo {
        endCursor
        hasNextPage
      }
    }
  }
}
''';

// const String addCountryMutation = '''
//   mutation AddCountry(\$name: String!, \$capital: String!) {
//     addCountry(name: \$name, capital: \$capital) {
//       name
//       capital
//     }
//   }
// ''';
