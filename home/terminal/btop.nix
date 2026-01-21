{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    btop
  ];

  programs.btop = {
    enable = true;

    settings = {
      truecolor = true;
      rounded_corners = true;
      graph_symbol = "braille";
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
      vim_keys = false;
      shown_boxes = "cpu mem net proc gpu0";
      update_ms = 2000;

      proc_sorting = "memory";
      proc_reversed = false;
      proc_tree = false;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = false;
      proc_mem_bytes = true;
      proc_cpu_graphs = true;
      proc_info_smaps = false;
      proc_left = false;
      proc_filter_kernel = false;
      proc_aggregate = false;

      cpu_graph_upper = "Auto";
      cpu_graph_lower = "Auto";
      cpu_invert_lower = true;
      cpu_single_graph = false;
      cpu_bottom = false;
      show_uptime = true;
      check_temp = true;
      cpu_sensor = "Auto";
      show_coretemp = true;
      temp_scale = "celsius";
      base_10_sizes = false;
      show_cpu_freq = true;
      clock_format = "%X";
      background_update = true;
      show_cpu_watts = true;

      show_gpu_info = "Auto";
      gpu_mirror_graph = true;

      mem_graphs = true;
      mem_below_net = false;
      zfs_arc_cached = true;
      show_swap = true;
      swap_disk = true;
      show_disks = true;
      only_physical = true;
      use_fstab = true;
      zfs_hide_datasets = false;
      disk_free_priv = false;
      show_io_stat = true;
      io_mode = true;
      io_graph_combined = false;

      net_download = 100;
      net_upload = 100;
      net_auto = true;
      net_sync = true;
      base_10_bitrate = "Auto";

      show_battery = true;
      selected_battery = "Auto";
      show_battery_watts = true;

      log_level = "WARNING";
      nvml_measure_pcie_speeds = true;
      rsmi_measure_pcie_speeds = true;
    };
  };

  stylix.targets.btop.enable = true;
}
