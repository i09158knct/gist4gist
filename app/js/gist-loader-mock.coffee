define 'gist-loader-mock', [
  'jquery'
  'underscore'
], ($, _) ->
  class GistLoader
    constructor: (loader=$.getJSON) ->
      @_loader = loader

    load: (id, cb) ->
      cb?(
        meta:
          "X-RateLimit-Limit": "60"
          "X-RateLimit-Remaining": "56"
          "X-GitHub-Media-Type": "github.beta"
          "status": 200
        data:
          url: "https://api.github.com/gists/3979762"
          forks_url: "https://api.github.com/gists/3979762/forks"
          commits_url: "https://api.github.com/gists/3979762/commits"
          id: "c4e2a4841cd45b4cea6a"
          git_pull_url: "https://gist.github.com/3979762.git"
          git_push_url: "https://gist.github.com/3979762.git"
          html_url: "https://gist.github.com/3979762"
          files:
            "explanation.md":
              filename: "explanation.md"
              type: "application/javascript"
              language: "Markdown"
              raw_url: "https://gist.github.com/raw/3979762/6a15d23a43f10f00b1ee52d00fabb652f53d499d/fizzbuzz.js"
              size: 379
              content: '''
                c4e2a4841cd45b4cea6a
                ====================

                ### Nice Explanation

                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium minus aperiam dignissimos non aspernatur rem asperiores impedit voluptas odit atque fuga quibusdam libero voluptate optio eum! Libero neque totam laborum.

                1. First
                --------

                - explanation.md: [1,2,3]

                Good, good.

                ```js
                var b = [1,3,3,4];
                ```

                I like this.

                2. Second
                ---------
                - explanation.md: [4]

                a

                - js
                - coffee
                - ts



                - aaa
                - bbb
                - ccc

                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam modi consectetur libero eius quam soluta et magni nostrum eligendi blanditiis corporis obcaecati delectus esse asperiores numquam quis earum. Harum animi.

                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates est id vitae molestias placeat nihil aspernatur recusandae quidem nisi temporibus quam odit sequi eaque voluptatibus facere cupiditate blanditiis ex eum!

                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis sint unde a suscipit delectus nam ipsum veritatis doloribus facilis enim. Officia aliquam iusto inventore et a quasi quisquam fugit impedit.

                Eius ut nam illo quis doloremque praesentium architecto incidunt itaque fugit quas quidem similique necessitatibus minus aliquam quo reiciendis perferendis officiis ullam maxime consequatur sit aperiam ipsum cum excepturi exercitationem.

                Voluptas officia quia in praesentium reiciendis iure rem ea id sequi dignissimos ex corporis impedit perspiciatis soluta omnis totam eius commodi dolorum vero facilis laboriosam cum enim. Nam laudantium animi!


                3. Final
                --------

                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo animi amet quibusdam laudantium perspiciatis libero incidunt nulla architecto veritatis ratione qui dignissimos id. Illo totam recusandae impedit ducimus ab facere.

                That's Allllllllllllllllllllllll!!!!!!!!!!!

                '''
                # Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid explicabo sed quibusdam asperiores fuga dolor dignissimos corporis dolorum dolores fugiat odit sunt rem aliquam rerum unde reprehenderit hic labore consequatur.
            "fizzbuzz.js":
              filename: "fizzbuzz.js"
              type: "application/javascript"
              language: "Markdown"
              raw_url: "https://gist.github.com/raw/3979762/6a15d23a43f10f00b1ee52d00fabb652f53d499d/fizzbuzz.js"
              size: 379
              content: '''
                function toFizzBuzz(num) {
                  return {
                    3:         'Fizz',
                    5:         'Buzz',
                    15:        'FizzBuzz',
                    otherwise: '' + num
                  }[(num % 15) ? (num % 5) ? (num % 3) ? 'otherwise' : 3 : 5 : 15];
                }

                var targets = (function (len) {
                  return Array.apply(null, new Array(len)).map(function(undef, i) {
                    return i;
                  });
                })(100);

                console.log(targets.map(toFizzBuzz));

                '''
                # Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid explicabo sed quibusdam asperiores fuga dolor dignissimos corporis dolorum dolores fugiat odit sunt rem aliquam rerum unde reprehenderit hic labore consequatur.

          public: true
          created_at: "2012-10-30T11:44:47Z"
          updated_at: "2013-02-21T15:50:20Z"
          description: "seed3"
          comments: 0
          user:
            login: "i09158knct"
            id: 1635689
            avatar_url: "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
            gravatar_id: "4894d9823bd6dff26d7f33bb23b3a92f"
            url: "https://api.github.com/users/i09158knct"
            html_url: "https://github.com/i09158knct"
            followers_url: "https://api.github.com/users/i09158knct/followers"
            following_url: "https://api.github.com/users/i09158knct/following"
            gists_url: "https://api.github.com/users/i09158knct/gists{/gist_id}"
            starred_url: "https://api.github.com/users/i09158knct/starred{/owner}{/repo}"
            subscriptions_url: "https://api.github.com/users/i09158knct/subscriptions"
            organizations_url: "https://api.github.com/users/i09158knct/orgs"
            repos_url: "https://api.github.com/users/i09158knct/repos"
            events_url: "https://api.github.com/users/i09158knct/events{/privacy}"
            received_events_url: "https://api.github.com/users/i09158knct/received_events"
            type: "User"
          comments_url: "https://api.github.com/gists/3979762/comments"
          forks: []
          history: [
            {
              "user":
                "login": "i09158knct"
                "id": 1635689
                "avatar_url": "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
                "gravatar_id": "4894d9823bd6dff26d7f33bb23b3a92f"
                "url": "https://api.github.com/users/i09158knct"
                "html_url": "https://github.com/i09158knct"
                "followers_url": "https://api.github.com/users/i09158knct/followers"
                "following_url": "https://api.github.com/users/i09158knct/following"
                "gists_url": "https://api.github.com/users/i09158knct/gists{/gist_id}"
                "starred_url": "https://api.github.com/users/i09158knct/starred{/owner}{/repo}"
                "subscriptions_url": "https://api.github.com/users/i09158knct/subscriptions"
                "organizations_url": "https://api.github.com/users/i09158knct/orgs"
                "repos_url": "https://api.github.com/users/i09158knct/repos"
                "events_url": "https://api.github.com/users/i09158knct/events{/privacy}"
                "received_events_url": "https://api.github.com/users/i09158knct/received_events"
                "type": "User"
              "version": "4c70a3edec5202813162d78ba104d626b6c7a634"
              "committed_at": "2013-02-21T15:50:20Z"
              "change_status":
                "total": 10
                "additions": 3
                "deletions": 7
              "url": "https://api.github.com/gists/3979762/4c70a3edec5202813162d78ba104d626b6c7a634"
            }
            {
              "user":
                "login": "i09158knct"
                "id": 1635689
                "avatar_url": "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
                "gravatar_id": "4894d9823bd6dff26d7f33bb23b3a92f"
                "url": "https://api.github.com/users/i09158knct"
                "html_url": "https://github.com/i09158knct"
                "followers_url": "https://api.github.com/users/i09158knct/followers"
                "following_url": "https://api.github.com/users/i09158knct/following"
                "gists_url": "https://api.github.com/users/i09158knct/gists{/gist_id}"
                "starred_url": "https://api.github.com/users/i09158knct/starred{/owner}{/repo}"
                "subscriptions_url": "https://api.github.com/users/i09158knct/subscriptions"
                "organizations_url": "https://api.github.com/users/i09158knct/orgs"
                "repos_url": "https://api.github.com/users/i09158knct/repos"
                "events_url": "https://api.github.com/users/i09158knct/events{/privacy}"
                "received_events_url": "https://api.github.com/users/i09158knct/received_events"
                "type": "User"
              "version": "5efd0fd31cbe928091faa41c48af30092d3a940c"
              "committed_at": "2013-02-21T15:46:33Z"
              "change_status":
                "total": 13
                "additions": 6
                "deletions": 7
              "url": "https://api.github.com/gists/3979762/5efd0fd31cbe928091faa41c48af30092d3a940c"
            }
            {
              "user":
                "login": "i09158knct"
                "id": 1635689
                "avatar_url": "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
                "gravatar_id": "4894d9823bd6dff26d7f33bb23b3a92f"
                "url": "https://api.github.com/users/i09158knct"
                "html_url": "https://github.com/i09158knct"
                "followers_url": "https://api.github.com/users/i09158knct/followers"
                "following_url": "https://api.github.com/users/i09158knct/following"
                "gists_url": "https://api.github.com/users/i09158knct/gists{/gist_id}"
                "starred_url": "https://api.github.com/users/i09158knct/starred{/owner}{/repo}"
                "subscriptions_url": "https://api.github.com/users/i09158knct/subscriptions"
                "organizations_url": "https://api.github.com/users/i09158knct/orgs"
                "repos_url": "https://api.github.com/users/i09158knct/repos"
                "events_url": "https://api.github.com/users/i09158knct/events{/privacy}"
                "received_events_url": "https://api.github.com/users/i09158knct/received_events"
                "type": "User"
              "version": "a600534c0461f22694a02d3cf43a87985ec7b86b"
              "committed_at": "2012-10-30T11:44:48Z"
              "change_status":
                "total": 23
                "additions": 23
                "deletions": 0
              "url": "https://api.github.com/gists/3979762/a600534c0461f22694a02d3cf43a87985ec7b86b"
            }
          ]
      )
