crumb :root do
  link "トップ", root_path
end

crumb :new do
  link "出品", new_original_item_path
  parent :root
end

crumb :show do
  link "商品詳細", original_item_path
  parent :root
end

crumb :user do |user|
  link user.shop_name, user_path
  parent :root
end

crumb :search do
  link "商品検索", search_original_items_path
  parent :root
end

crumb :edit do
  link "編集", edit_original_item_path
  parent :show
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).