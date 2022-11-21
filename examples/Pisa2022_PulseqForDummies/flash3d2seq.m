% set Siemens system limits
sysSiemens = mr.opts('MaxGrad', 50, 'GradUnit', 'mT/m', ...
    'MaxSlew', 200, 'SlewUnit', 'T/m/s', ... 
    'rfRingdownTime', 20e-6, 'rfDeadTime', 100e-6, 'adcDeadTime', 10e-6);

pulsegeq.ge2seq('flash3d.tar', sysGE, sysSiemens, ...
    'seqFile', 'flash3d.seq', ...  % output file name
    'nt', 100, ...
    'FOV', FOV/100);                % m

seq = mr.Sequence(sysSiemens);
seq.read('flash3d.seq');
seq.plot('timeRange', [0 20e-3]);

