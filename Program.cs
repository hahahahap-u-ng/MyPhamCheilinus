using Microsoft.EntityFrameworkCore;
using MyPhamCheilinus.Models;
using MyPhamCheilinus.Repository;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

var connectionString = builder.Configuration.GetConnectionString("_2023MyPhamContext");
builder.Services.AddDbContext<_2023MyPhamContext>(x => x.UseSqlServer(connectionString));
builder.Services.AddScoped<ILoaiRepository, LoaiRepository>();
builder.Services.AddScoped<IHangRepository, HangRepository>();
builder.Services.AddScoped<ICTLoaiRepository, CTLoaiRepository>();


builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.IsEssential = true;
});
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseSession();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "sanphamtheodanhmuc",
    pattern: "sanpham/sanphamtheodanhmuc/{maDanhMuc}",
    defaults: new { controller = "SanPham", action = "SanPhamTheoDanhMuc" });

app.MapControllerRoute(
    name: "filter",
    pattern: "home/filter",
    defaults: new { controller = "Home", action = "Filter" });

app.Run();



