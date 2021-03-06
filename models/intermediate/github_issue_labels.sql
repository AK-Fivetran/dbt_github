with issue_label as (

    select *
    from {{ ref('stg_github_issue_label') }}
  
)

select
  issue_id,
  {{ string_agg( 'label', "', '" )}} as labels
from issue_label
group by issue_id
