(function() {

  define('gist-loader-mock', ['jquery', 'underscore'], function($, _) {
    var GistLoader;
    return GistLoader = (function() {

      function GistLoader(loader) {
        if (loader == null) {
          loader = $.getJSON;
        }
        this._loader = loader;
      }

      GistLoader.prototype.load = function(id, cb) {
        return typeof cb === "function" ? cb({
          meta: {
            "X-RateLimit-Limit": "60",
            "X-RateLimit-Remaining": "56",
            "X-GitHub-Media-Type": "github.beta",
            "status": 200
          },
          data: {
            url: "https://api.github.com/gists/3979762",
            forks_url: "https://api.github.com/gists/3979762/forks",
            commits_url: "https://api.github.com/gists/3979762/commits",
            id: "c4e2a4841cd45b4cea6a",
            git_pull_url: "https://gist.github.com/3979762.git",
            git_push_url: "https://gist.github.com/3979762.git",
            html_url: "https://gist.github.com/3979762",
            files: {
              "explanation.md": {
                filename: "explanation.md",
                type: "application/javascript",
                language: "Markdown",
                raw_url: "https://gist.github.com/raw/3979762/6a15d23a43f10f00b1ee52d00fabb652f53d499d/fizzbuzz.js",
                size: 379,
                content: 'c4e2a4841cd45b4cea6a\n====================\n\n### Nice Explanation\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium minus aperiam dignissimos non aspernatur rem asperiores impedit voluptas odit atque fuga quibusdam libero voluptate optio eum! Libero neque totam laborum.\n\n1. First\n--------\n\n- explanation.md: [1,2,3]\n\nGood, good.\n\n```js\nvar b = [1,3,3,4];\n```\n\nI like this.\n\n2. Second\n---------\n- explanation.md: [4]\n\na\n\n- js\n- coffee\n- ts\n\n\n\n- aaa\n- bbb\n- ccc\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Totam modi consectetur libero eius quam soluta et magni nostrum eligendi blanditiis corporis obcaecati delectus esse asperiores numquam quis earum. Harum animi.\n\n3. Final\n--------\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Illo animi amet quibusdam laudantium perspiciatis libero incidunt nulla architecto veritatis ratione qui dignissimos id. Illo totam recusandae impedit ducimus ab facere.\n\nThat\'s Allllllllllllllllllllllll!!!!!!!!!!!\n'
              }
            },
            "public": true,
            created_at: "2012-10-30T11:44:47Z",
            updated_at: "2013-02-21T15:50:20Z",
            description: "seed3",
            comments: 0,
            user: {
              login: "i09158knct",
              id: 1635689,
              avatar_url: "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
              gravatar_id: "4894d9823bd6dff26d7f33bb23b3a92f",
              url: "https://api.github.com/users/i09158knct",
              html_url: "https://github.com/i09158knct",
              followers_url: "https://api.github.com/users/i09158knct/followers",
              following_url: "https://api.github.com/users/i09158knct/following",
              gists_url: "https://api.github.com/users/i09158knct/gists{/gist_id}",
              starred_url: "https://api.github.com/users/i09158knct/starred{/owner}{/repo}",
              subscriptions_url: "https://api.github.com/users/i09158knct/subscriptions",
              organizations_url: "https://api.github.com/users/i09158knct/orgs",
              repos_url: "https://api.github.com/users/i09158knct/repos",
              events_url: "https://api.github.com/users/i09158knct/events{/privacy}",
              received_events_url: "https://api.github.com/users/i09158knct/received_events",
              type: "User"
            },
            comments_url: "https://api.github.com/gists/3979762/comments",
            forks: [],
            history: [
              {
                "user": {
                  "login": "i09158knct",
                  "id": 1635689,
                  "avatar_url": "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
                  "gravatar_id": "4894d9823bd6dff26d7f33bb23b3a92f",
                  "url": "https://api.github.com/users/i09158knct",
                  "html_url": "https://github.com/i09158knct",
                  "followers_url": "https://api.github.com/users/i09158knct/followers",
                  "following_url": "https://api.github.com/users/i09158knct/following",
                  "gists_url": "https://api.github.com/users/i09158knct/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/i09158knct/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/i09158knct/subscriptions",
                  "organizations_url": "https://api.github.com/users/i09158knct/orgs",
                  "repos_url": "https://api.github.com/users/i09158knct/repos",
                  "events_url": "https://api.github.com/users/i09158knct/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/i09158knct/received_events",
                  "type": "User"
                },
                "version": "4c70a3edec5202813162d78ba104d626b6c7a634",
                "committed_at": "2013-02-21T15:50:20Z",
                "change_status": {
                  "total": 10,
                  "additions": 3,
                  "deletions": 7
                },
                "url": "https://api.github.com/gists/3979762/4c70a3edec5202813162d78ba104d626b6c7a634"
              }, {
                "user": {
                  "login": "i09158knct",
                  "id": 1635689,
                  "avatar_url": "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
                  "gravatar_id": "4894d9823bd6dff26d7f33bb23b3a92f",
                  "url": "https://api.github.com/users/i09158knct",
                  "html_url": "https://github.com/i09158knct",
                  "followers_url": "https://api.github.com/users/i09158knct/followers",
                  "following_url": "https://api.github.com/users/i09158knct/following",
                  "gists_url": "https://api.github.com/users/i09158knct/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/i09158knct/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/i09158knct/subscriptions",
                  "organizations_url": "https://api.github.com/users/i09158knct/orgs",
                  "repos_url": "https://api.github.com/users/i09158knct/repos",
                  "events_url": "https://api.github.com/users/i09158knct/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/i09158knct/received_events",
                  "type": "User"
                },
                "version": "5efd0fd31cbe928091faa41c48af30092d3a940c",
                "committed_at": "2013-02-21T15:46:33Z",
                "change_status": {
                  "total": 13,
                  "additions": 6,
                  "deletions": 7
                },
                "url": "https://api.github.com/gists/3979762/5efd0fd31cbe928091faa41c48af30092d3a940c"
              }, {
                "user": {
                  "login": "i09158knct",
                  "id": 1635689,
                  "avatar_url": "https://secure.gravatar.com/avatar/4894d9823bd6dff26d7f33bb23b3a92f?d=https….akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
                  "gravatar_id": "4894d9823bd6dff26d7f33bb23b3a92f",
                  "url": "https://api.github.com/users/i09158knct",
                  "html_url": "https://github.com/i09158knct",
                  "followers_url": "https://api.github.com/users/i09158knct/followers",
                  "following_url": "https://api.github.com/users/i09158knct/following",
                  "gists_url": "https://api.github.com/users/i09158knct/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/i09158knct/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/i09158knct/subscriptions",
                  "organizations_url": "https://api.github.com/users/i09158knct/orgs",
                  "repos_url": "https://api.github.com/users/i09158knct/repos",
                  "events_url": "https://api.github.com/users/i09158knct/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/i09158knct/received_events",
                  "type": "User"
                },
                "version": "a600534c0461f22694a02d3cf43a87985ec7b86b",
                "committed_at": "2012-10-30T11:44:48Z",
                "change_status": {
                  "total": 23,
                  "additions": 23,
                  "deletions": 0
                },
                "url": "https://api.github.com/gists/3979762/a600534c0461f22694a02d3cf43a87985ec7b86b"
              }
            ]
          }
        }) : void 0;
      };

      return GistLoader;

    })();
  });

}).call(this);
