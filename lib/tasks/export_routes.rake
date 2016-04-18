task export_routes: :environment do
  Route.all.each do |route|
    RouteVersion.export_route(route) if route.new_version?
  end
end
