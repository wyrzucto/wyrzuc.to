task export_routes: :environment do
  Route.all.each do |route|
    if route.has_new_version?
      RouteVersion.export_route(route)
    end
  end
end